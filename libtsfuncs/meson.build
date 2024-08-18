# Define source files for libtsfuncs
libtsfuncs_sources = files(
  'log.c',
  'tsfuncs.c',
  'crc.c',
  'misc.c',
  'time.c',
  'sections.c',
  'secdata.c',
  'descs.c',
  'pat.c',
  'pat_desc.c',
  'cat.c',
  'pmt.c',
  'nit.c',
  'nit_desc.c',
  'sdt.c',
  'sdt_desc.c',
  'eit.c',
  'eit_desc.c',
  'tdt.c',
  'tdt_desc.c',
  'pes.c',
  'pes_data.c',
  'pes_es.c',
  'privsec.c'
)

# Create the static library
libtsfuncs = static_library('tsfuncs', libtsfuncs_sources)

# Declare the dependency for the main project
libtsfuncs_dep = declare_dependency(link_with: libtsfuncs)

