project('mptsd', 'c', version: '1.2',
  default_options: [
    'optimization=2',
    'warning_level=3',
  ]
)

# Define the compiler and build options
cc = meson.get_compiler('c')
build_id = run_command('date', '+%F_%R', check: true).stdout().strip()
git_ver = run_command('git', 'describe', '--tags', '--dirty', '--always', check: true).stdout().strip()

cflags = [
  '-ggdb',
  '-Wshadow',
  '-Wformat-security',
  '-Wno-strict-aliasing',
  '-D_GNU_SOURCE',
  '-DBUILD_ID="' + build_id + '"',
  '-DGIT_VER="' + (git_ver != '' ? git_ver : 'v1.1') + '"'
]

add_project_arguments(cflags, language: 'c')

# Define libraries using Meson's dependency function
pthread_dep = dependency('threads')
math_dep = cc.find_library('m')
rt_dep = cc.find_library('rt', required: false)

libs = [pthread_dep, math_dep, rt_dep]

# Include the subdirectories for libfuncs and libtsfuncs
subdir('libfuncs')
subdir('libtsfuncs')

# Define source files for mptsd
sources = files(
  'iniparser.c', 'inidict.c', 'pidref.c', 'data.c', 'config.c',
  'sleep.c', 'network.c', 'input.c',
  'output_psi.c', 'output_mix.c', 'output_write.c',
  'web_pages.c', 'web_server.c', 'mptsd.c'
)

# Create the mptsd executable and link with libfuncs and libtsfuncs
mptsd = executable('mptsd', sources, dependencies: [libfuncs_dep, libtsfuncs_dep] + libs, install: true)

# Optional stripping step
strip_target = custom_target(
  'strip',
  input: mptsd,
  output: 'mptsd',
  command: [find_program('strip'), mptsd]
)

# Custom clean step
clean_custom_target = custom_target(
  'clean_custom',
  output: 'cleaned',
  command: ['rm', '-f', 'mptsd', '*.o', '*~']
)

