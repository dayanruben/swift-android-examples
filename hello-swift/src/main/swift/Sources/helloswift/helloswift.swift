import Android

@_cdecl("Java_org_example_helloswift_MainActivity_stringFromSwift")
public func MainActivity_stringFromSwift(env: UnsafeMutablePointer<JNIEnv?>, clazz: jclass) -> jstring {
    let hello = ["Hello", "from", "Swift", "❤️"].joined(separator: " ")
    return hello.withCString { ptr in
    	env.pointee!.pointee.NewStringUTF(env, ptr)!
    }
}