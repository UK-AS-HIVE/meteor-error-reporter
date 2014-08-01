Package.describe({
  summary: "Error Reporting"
});

Package.on_use(function (api) {
  api.use('coffeescript', ['client', 'server']);
  api.use(['bootstrap-3', 'ui', 'spacebars', 'templating'], 'client');

  api.add_files(['client.html', 'client.coffee'], 'client');
});
