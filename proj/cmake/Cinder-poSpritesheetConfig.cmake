if(NOT TARGET Cinder-poSpritesheet)
    # Define ${Cinder-poSpritesheet_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(Cinder-poSpritesheet_PROJECT_ROOT "C:/Users/gabis/Cinder/blocks/Cinder-poSpritesheet" ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "C:/Users/gabis/Cinder" ABSOLUTE)

    # Make a list of source files and define that to be ${SOURCE_LIST}.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
            "${Cinder-poSpritesheet_PROJECT_ROOT}/src/poSpritesheet/poSpritesheet.cpp"
            "${Cinder-poSpritesheet_PROJECT_ROOT}/src/poSpritesheet/poSpritesheetAnimation.cpp")

    # Create the library!
    add_library(Cinder-poSpritesheet ${SOURCE_LIST})

    # Add include directories.
    # Notice that `cinderblock.xml` has `<includePath>src</includePath>`.
    # So you need to set `../../src/` to include.
    target_include_directories(Cinder-poSpritesheet PUBLIC "${Cinder-poSpritesheet_PROJECT_ROOT}/src" )
    target_include_directories(Cinder-poSpritesheet SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )


    # If your Cinder block has no source code but instead pre-build libraries,
    # you can specify all of them here (uncomment the below line and adjust to your needs).
    # Make sure to use the libraries for the right platform.
    # # target_link_libraries(Cinder-poSpritesheet "${Cinder-OpenCV_PROJECT_ROOT}/lib/libopencv_core.a")

    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(Cinder-poSpritesheet PRIVATE cinder)

endif()
#Sometimes, there are a lot of source files. Instead of declaring each and every file in ${SOURCE_LIST}, you can just use a CMake GLOB pattern for them instead:
