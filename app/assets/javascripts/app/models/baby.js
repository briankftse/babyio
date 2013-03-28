app.models.Baby = Backbone.Model.extend({

  initialize: function() {
    this.posts = new app.collections.Posts();
    this.posts.reset(this.get("posts"));
  },

  url: function() {
    return "/users/" + app.currentUser.get("id") + "/babies";
  },

  full_name: function() {
    return this.get("first_name") + " " + this.get("last_name");
  }

});
