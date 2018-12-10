package com.example.systemshortcuts;

import android.annotation.TargetApi;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.media.AudioManager;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.provider.Settings;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * SystemShortcutsPlugin
 */
public class SystemShortcutsPlugin implements MethodCallHandler {
    private final MethodChannel channel;
    private Activity activity;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "system_shortcuts");
        channel.setMethodCallHandler(new SystemShortcutsPlugin(registrar.activity(), channel));
    }

    private SystemShortcutsPlugin(Activity activity, MethodChannel channel) {
        this.activity = activity;
        this.channel = channel;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("home")) {
            home();
        } else if (call.method.equals("back")) {
            back();
        } else if (call.method.equals("volDown")) {
            volDown();
        } else if (call.method.equals("volUp")) {
            volUp();
        } else if (call.method.equals("orientLandscape")) {
            orientLandscape();
        } else if (call.method.equals("orientPortrait")) {
            orientPortrait();
        } else if (call.method.equals("wifi")) {
            wifi();
        } else if (call.method.equals("checkWifi")) {
            result.success(checkWifi());
        } else if (call.method.equals("bluetooth")) {
            bluetooth();
        } else if (call.method.equals("checkBluetooth")) {
            result.success(checkBluetooth());
        }  else if (call.method.equals("checkAirplaneMode")) {
            result.success(checkAirplaneMode());
        } else {
            result.notImplemented();
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
            System.out.println(mBluetoothAdapter.isEnabled() + " 1");
            mBluetoothAdapter.disable();
        } else {
            System.out.println(mBluetoothAdapter.isEnabled() + " 2");
            mBluetoothAdapter.enable();
        }
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    boolean checkBluetooth() {
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        return mBluetoothAdapter.isEnabled();
    }

    @TargetApi(Build.VERSION_CODES.JELLY_BEAN_MR1)
    boolean checkAirplaneMode() {
        // read the airplane mode setting
        boolean isEnabled = Settings.Global.getInt(
                this.activity.getContentResolver(),
                Settings.System.AIRPLANE_MODE_ON, 0) == 1;
        return isEnabled;
    }

}
