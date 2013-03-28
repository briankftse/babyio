app.collections.Babies = Backbone.Collection.extend({
  model: app.models.Baby,

  url: function() {
    return this.baby.get("username");
  }

});
