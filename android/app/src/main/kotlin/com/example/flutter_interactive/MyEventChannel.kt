package com.example.flutter_interactive

import android.app.Activity
import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel

class MyEventChannel(messenger: BinaryMessenger, activity: Activity) : EventChannel.StreamHandler, SensorEventListener {

    private var myChannel: EventChannel = EventChannel(messenger, "com.flutter.test.event_channel")
    private var activity1 = activity

    private var sensorManager: SensorManager? = null
    private var eventSink: EventChannel.EventSink? = null
    private var mLight: Sensor? = null

    init {
        myChannel.setStreamHandler(this)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sensorManager = activity1.getSystemService(Context.SENSOR_SERVICE) as SensorManager
        if (sensorManager?.getDefaultSensor(Sensor.TYPE_GRAVITY) != null) {
            mLight = sensorManager?.getDefaultSensor(Sensor.TYPE_GRAVITY)
            mLight?.also { light ->
                sensorManager?.registerListener(this, light, SensorManager.SENSOR_DELAY_NORMAL)
            }
        }
        eventSink = events!!
    }

    override fun onCancel(arguments: Any?) {
        sensorManager?.unregisterListener(this)
        eventSink = null
        sensorManager = null
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {

    }

    override fun onSensorChanged(event: SensorEvent) {
        val data = arrayListOf<String>()
        data.add(event.values[0].toString())
        data.add(event.values[1].toString())
        data.add(event.values[2].toString())
        eventSink?.success(data)
    }
}
