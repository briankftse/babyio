app.Router = Backbone.Router.extend({

  routes: {
    // TODO: Need to fix routes, so BB doesn't just get the general url
    // ""               : "home",
    ""              : "home",    // root
    "/settings/account" : "settings",
    "stream/:username"  : "baby",  // #username OR #/username
    "create-baby"  : "createBaby"  // #username OR #/username
  },

  home: function() {
    var home_view = new app.pages.Home({ model: app.currentUser });
  },

  settings: function() {

  },

  baby: function(username) {
    var baby = app.currentUser.babies.where({ username: username })[0];
    var baby_view = new app.pages.Stream({ model: baby });
  },

  createBaby: function() {
    var create_baby_view = new app.forms.Baby({
      el: $(".content")
    });
  }

});
