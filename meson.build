# Project name, programming language and version
project (
    'Sherlock',
    'vala', 'c',
    version: '0.0.1'
)

# Translation module
i18n = import ('i18n')

gnome = import('gnome')

# Project arguments
add_project_arguments (
    '-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name ()),
    language: 'c'
)

# Listing dependencies
dependencies = [
    dependency ('glib-2.0'),
    dependency ('gtk+-3.0'),
    dependency ('libsoup-2.4'),
    dependency ('json-glib-1.0'),
    dependency ('gee-0.8'),
    dependency ('gmodule-2.0')
]

subdir ('src')
subdir ('resources')

# Executable
executable (
    meson.project_name (),
    sources,
    sherlock_resources,
    dependencies: dependencies,
    install: true
)

subdir ('data')
subdir ('po')

meson.add_install_script ('meson/post_install.py')
