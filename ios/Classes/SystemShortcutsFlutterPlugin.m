#import "SystemShortcutsFlutterPlugin.h"
#if __has_include(<SystemShortcutsFlutter/SystemShortcutsFlutter-Swift.h>)
#import <SystemShortcutsFlutter/SystemShortcutsFlutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "SystemShortcutsFlutter-Swift.h"
#endif

@implementation SystemShortcutsFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSystemShortcutsFlutterPlugin registerWithRegistrar:registrar];
}
@end
