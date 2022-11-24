catay_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1'),
]


catay_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'FFlagEditor.vala'
]


blueprints_src = [
'FFlagEditor.blp',
    'window.blp'
]

blueprints_ui = []
blueprints_vala = []
foreach b : blueprints_src
	blueprints_ui += b.replace('.blp', '.ui')
	blueprints_vala += b + '.vala'
endforeach


blueprints = custom_target('blueprints',
  input: blueprints_src,
  output: blueprints_ui,
  command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTDIR@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)

blueprints_hack = custom_target('blueprints_hack',
	input: blueprints,
	output: blueprints_vala,
	command: [find_program('touch'), '@OUTPUT@'],
)

catay_sources += gnome.compile_resources(
  'catay-resources',
  'catay.gresource.xml',
  c_name: 'catay',
  dependencies: blueprints,
)



executable('catay', [catay_sources,blueprints_hack],
	vala_args: [
		'--gresourcesdir=src/',
	],

  dependencies: catay_deps,
       install: true,
)
