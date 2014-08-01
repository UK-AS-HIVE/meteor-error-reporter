Package.describe({
  summary: "Error Reporting"
});

Package.on_use(function (api) {
  api.use('coffeescript', ['client', 'server']);
  api.use(['bootstrap-3', 'ui', 'spacebars', 'templating', 'accounts-base', 'deps', 'minimongo', 'session'], 'client');

  api.add_files(['client.html', 'client.coffee'], 'client');
  api.add_files(['collections.coffee'], ['client', 'server']);

});
