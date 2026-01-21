# Prevent stripping of Flutter's embedding classes
-keep class io.flutter.embedding.** { *; }

# Keep all classes from Flutter and its plugins
-keep class io.flutter.plugins.** { *; }

# Keep Google Play Core classes
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# Keep classes referenced by Flutter's deferred components
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.PlayStoreDeferredComponentManager { *; }


