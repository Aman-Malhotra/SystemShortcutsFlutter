#import "SystemShortcutsPlugin.h"
#import <system_shortcuts/system_shortcuts-Swift.h>

@implementation SystemShortcutsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSystemShortcutsPlugin registerWithRegistrar:registrar];
}
@end
