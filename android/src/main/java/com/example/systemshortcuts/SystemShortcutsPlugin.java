package com.example.systemshortcuts;

import android.annotation.TargetApi;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.media.AudioManager;
import android.net.wifi.WifiManager;
import android.os.Build;

import androidx.annotation.NonNull;


import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * SystemShortcutsPlugin
 */
public class SystemShortcutsPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler {
    private MethodChannel channel;
    private Activity activity;

    /**
     * v2 plugin embedding
     */
    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(
                binding.getBinaryMessenger(), "system_shortcuts");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
    }

    @Override
    public void onAttachedToActivity(ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        activity = null;
    }


    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        SystemShortcutsPlugin instance = new SystemShortcutsPlugin();
        instance.channel = new MethodChannel(registrar.messenger(), "system_shortcuts");
        instance.activity = registrar.activity();
        instance.channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "home":
                home();
                break;
            case "back":
                back();
                break;
            case "volDown":
                volDown();
                break;
            case "volUp":
                volUp();
                break;
            case "orientLandscape":
                orientLandscape();
                break;
            case "orientPortrait":
                orientPortrait();
                break;
            case "wifi":
                wifi();
                break;
            case "checkWifi":
                result.success(checkWifi());
                break;
            case "bluetooth":
                bluetooth();
                break;
            case "checkBluetooth":
                result.success(checkBluetooth());
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    void home() {
        this.activity.startActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME));
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    void back() {
        this.activity.onBackPressed();
    }

    void volDown() {
        AudioManager audioManager = (AudioManager) this.activity.getApplicationContext().getSystemService(Context.AUDIO_SERVICE);
        audioManager.adjustVolume(AudioManager.ADJUST_LOWER, AudioManager.FLAG_PLAY_SOUND);
    }

    void volUp() {
        AudioManager audioManager = (AudioManager) this.activity.getApplicationContext().getSystemService(Context.AUDIO_SERVICE);
        audioManager.adjustVolume(AudioManager.ADJUST_RAISE, AudioManager.FLAG_PLAY_SOUND);
    }

    void orientLandscape() {
        this.activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
    }

    void orientPortrait() {
        this.activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
    }

    void wifi() {
        WifiManager wifiManager = (WifiManager) this.activity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
        if (wifiManager.isWifiEnabled()) {
            wifiManager.setWifiEnabled(false);
        } else {
            wifiManager.setWifiEnabled(true);
        }
    }

    boolean checkWifi() {
        WifiManager wifiManager = (WifiManager) this.activity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
        return wifiManager.isWifiEnabled();
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    void bluetooth() {
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter.isEnabled()) {
            mBluetoothAdapter.disable();
        } else {
            mBluetoothAdapter.enable();
        }
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    boolean checkBluetooth() {
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        return mBluetoothAdapter.isEnabled();
    }

}
