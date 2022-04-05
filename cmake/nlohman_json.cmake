if(FABRIC_SDK_CPP_USE_EXTERNAL_JSON)
    find_package(nlohmann_json 3.2.0 REQUIRED)
else()
    include(FetchContent)

    FetchContent_Declare(json
        GIT_REPOSITORY https://github.com/ArthurSonzogni/nlohmann_json_cmake_fetchcontent
        GIT_TAG v3.9.1)

    FetchContent_GetProperties(json)
    if(NOT json_POPULATED)
        FetchContent_Populate(json)
        add_subdirectory(${json_SOURCE_DIR} ${json_BINARY_DIR} EXCLUDE_FROM_ALL)
    endif()

    set(JSON_BuildTests OFF CACHE INTERNAL "")
endif()