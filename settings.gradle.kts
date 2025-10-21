pluginManagement {
    repositories {
        mavenLocal()
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        mavenLocal()
        google()
        mavenCentral()
    }
}

rootProject.name = "Swift Android Examples"
include(":hello-swift")
include(":hello-swift-callback")
include(":hello-swift-library")
include(":native-activity")
include(":hashing-lib")
project(":hashing-lib").projectDir = file("hashing-example/hashing-lib")
include(":hashing-app")
project(":hashing-app").projectDir = file("hashing-example/hashing-app")
