app.collections.Posts = Backbone.Collection.extend({
  model: app.models.Post,

  url: function() {
    return this.username + "/posts";
  },

  initialize: function() {
  }
});
