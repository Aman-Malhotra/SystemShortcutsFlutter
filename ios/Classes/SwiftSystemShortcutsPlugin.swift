import Flutter
import UIKit
import MediaPlayer

public class SwiftSystemShortcutsPlugin: NSObject, FlutterPlugin {
  var registrar: FlutterPluginRegistrar?
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_shortcuts", binaryMessenger: registrar.messenger())
    let instance = SwiftSystemShortcutsPlugin(r: registrar)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    
    public init(r: FlutterPluginRegistrar) {
        registrar = r
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "home":
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        result("Sent to Home Screen")
        break;
    case "back":
        _ =  UIApplication.shared.keyWindow?.rootViewController?.navigationController?.popViewController(animated: true)
        result("Went Back a Screen")
        break;
    case "vol":
         let val = AVAudioSession.sharedInstance().outputVolume
        result(val)
        break;
    case "setVol":
        var  _arguments = call.arguments as! [String : Any];
        let vol = _arguments["value"] as? Float
        MPVolumeView.setVolume(vol ?? 0.5)
        let val = AVAudioSession.sharedInstance().outputVolume
        result("Volume Updated: \(val)")
        break;
    case "volUp":
        let val = AVAudioSession.sharedInstance().outputVolume
        MPVolumeView.setVolume(val + 0.1)
        result("Volume Up")
        break;
    case "volDown":
        let val = AVAudioSession.sharedInstance().outputVolume
        MPVolumeView.setVolume(val - 0.1)
        result("Volume Down")
        break;
    case "orientLandscapeLeft":
        let val = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(val, forKey: "orientation")
         result("Orientation Changed to Landscape Left")
        break;
    case "orientLandscapeRight":
        let val = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(val, forKey: "orientation")
        result("Orientation Changed to Landscape Right")
        break;
    case "orientLandscape":
        let val = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(val, forKey: "orientation")
        result("Orientation Changed to Landscape")
        break;
    case "orientPortrait":
        let val = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(val, forKey: "orientation")
        result("Orientation Changed to Portrait")
        break;
    case "orientPortraitUpsideDown":
        let val = UIInterfaceOrientation.portraitUpsideDown.rawValue
        UIDevice.current.setValue(val, forKey: "orientation")
        result("Orientation Changed to Portrait Upside Down")
        break;
    // case "wifi":
    //     result("Not Possible to Change Wifi Global Setting on iOS")
    //     break;
    case "checkWifi":
        result(true)
        break;
    // case "bluetooth":
    //     result(true)
    //     break;
    case "checkBluetooth":
        result(true)
        break;
    default:
        result("iOS " + UIDevice.current.systemVersion)
    }
  }
}

extension MPVolumeView {
  static func setVolume(_ volume: Float) {
    let volumeView = MPVolumeView()
    let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
      slider?.value = volume
    }
  }
}
