import Android

@_cdecl("Java_org_example_swiftlibrary_SwiftLibrary_stringFromSwift")
public func SwiftLibrary_stringFromSwift(env: UnsafeMutablePointer<JNIEnv?>, clazz: jclass) -> jstring {
    let hello = "Hello from Swift"
    return hello.withCString { ptr in
    	env.pointee!.pointee.NewStringUTF(env, ptr)!
    }
}