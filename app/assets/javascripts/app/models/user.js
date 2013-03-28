app.models.User = Backbone.Model.extend({
  initialize: function() {
    //this.bind('change:babies', this.updateBabies, this);
    //this.bind('all', this.updateBabies, this);
    this.babies = new app.collections.Babies();
    this.babies.url = "users/" + this.get("id") + "/babies";
  },

  url: function() {
    return "/users/" + this.get("id");
  },

  parse: function(response) {
    this.babies.reset(response.babies);
    return response;
  },

  updateBabies: function() {
    console.log('update babies');
    if(typeof this.babies !== 'undefined') {
      this.babies.reset(this.get("babies"));
    } else {
      this.babies = new app.collection.Babies(this.get("babies"));
    }
  }

});
