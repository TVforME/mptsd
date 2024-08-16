project('mptsd', 'c', version: '1.1')

# Define the compiler and build options
cc = meson.get_compiler('c')
build_id = run_command('date', '+%F_%R').stdout().strip()
git_ver = run_command('git', 'describe', '--tags', '--dirty', '--always', check: false).stdout().strip()

cflags = [
  '-ggdb', '-O2',
  '-Wall', '-Wextra', '-Wshadow',
  '-Wformat-security', '-Wno-strict-aliasing',
  '-D_GNU_SOURCE',
  '-DBUILD_ID="' + build_id + '"',
  '-DGIT_VER="' + (git_ver != '' ? git_ver : 'v1.1') + '"'
]

add_project_arguments(cflags, language: 'c')

# Define libraries
if host_machine.system() == 'darwin'
  libs = ['pthread', 'm']
else
  libs = ['pthread', 'm', 'rt']
endif

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
mptsd = executable('mptsd', sources, dependencies: [libfuncs_dep, libtsfuncs_dep], link_with: libs)

# Optional stripping step
strip_target = custom_target(
  'strip',
  input: mptsd,
  output: 'mptsd',
  command: [find_program('strip'), mptsd]
)

# Clean targets
clean_target = custom_target(
  'clean',
  output: 'cleaned',
  command: ['rm', '-f', 'mptsd', '*.o', '*~']
)

# Install the executable
install_data(mptsd, install_dir: get_option('bindir'))
