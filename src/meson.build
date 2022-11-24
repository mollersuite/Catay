catay_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'FFlagEditor.vala'
]

catay_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1'),
]

catay_sources += gnome.compile_resources('catay-resources',
  'catay.gresource.xml',
  c_name: 'catay'
)

executable('catay', catay_sources,
  dependencies: catay_deps,
       install: true,
)
