project('libfuncs', 'c')

# Define source files
libfuncs_sources = files(
  'queue.c',
  'list.c',
  'cbuf.c',
  'io.c',
  'log.c',
  'http_response.c',
  'asyncdns.c',
  'server.c',
  'misc.c'
)

# Create the static library
libfuncs = static_library('funcs', libfuncs_sources)

# Declare the dependency for the main project
libfuncs_dep = declare_dependency(link_with: libfuncs)

