Decanter - Live Coding
===

Overview
---

1. Generate Trips resource
2. Add validations to trip.rb
3. Write trips/new
4. Add create action to controller
5. Show that it fails
6. Make it succeed with manual parsing
7. Generate Destinations resource
8. Modify code for destination as nested resource to trip
9. Show that it fails
10. Make it succeed with manual parsing
11. Show Decanter


Generate Trips resource
---

```
rails g resource Trip name:string start_date:date end_date:date
rake db:migrate
```


Validations
---

```ruby
validates_presence_of :name, :start_date, :end_date
```


Write trips/new
---

```erb
<%= form_for @trip do |f| %>
  <p><%= f.object.errors.full_messages.join(", ") %></p>
  <div>
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div>
    <%= f.label :start_date %>
    <%= f.text_field :start_date, class: 'datepicker' %>
  </div>
  <div>
    <%= f.label :end_date %>
    <%= f.text_field :end_date, class: 'datepicker' %>
  </div>
  <div>
    <%= f.submit %>
  </div>
<% end %>
```


Add Create Action to Controller
---

```ruby
  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render 'new'
    end
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end
```


Generate Destinations Resource
---

```
rails g model Destination arrival_date:date departure_date:date city:string state:string trip:references
rake db:migrate
```

Modify code for destination as nested resource to trip
---

1. validates_presence_of :arrival_date, :departure_date, :city, :state
2. has_many :destinations
3. accepts_nested_attributes_for :destinations
4. update form (see below)
5. update strong_params: destinations_attributes: [:city, :state, :arrival_date, :departure_date]
6. update create action (see below)

** update form **

```erb
<%= form_for @trip do |f| %>
  <p><%= f.object.errors.full_messages.join(", ") %></p>
  <div>
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div>
    <%= f.label :start_date %>
    <%= f.text_field :start_date, class: 'datepicker' %>
  </div>
  <div>
    <%= f.label :end_date %>
    <%= f.text_field :end_date, class: 'datepicker' %>
  </div>
  <ul>
    <%= f.fields_for :destinations do |destination_builder| %>
      <div>
        <%= destination_builder.label :city %>
        <%= destination_builder.text_field :city %>
      </div>
      <div>
        <%= destination_builder.label :state %>
        <%= destination_builder.text_field :state %>
      </div>
      <div>
        <%= destination_builder.label :arrival_date %>
        <%= destination_builder.text_field :arrival_date, class: 'datepicker' %>
      </div>
      <div>
        <%= destination_builder.label :departure_date %>
        <%= destination_builder.text_field :departure_date, class: 'datepicker' %>
      </div>
    <% end %>
  </ul>
  <div>
    <%= f.submit %>
  </div>
<% end %>
```

** update create and new action **

```ruby
  def new
    @trip = Trip.new
    2.times do |i|
      @trip.destinations.build
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.start_date = Date.strptime(trip_params[:start_date], '%m/%d/%Y') if trip_params[:start_date].present?
    @trip.end_date = Date.strptime(trip_params[:end_date], '%m/%d/%Y') if trip_params[:end_date].present?

    @trip.destinations.each_with_index do |destination, index|
      arrival_date = trip_params[:destinations_attributes]["#{index}"][:arrival_date]
      departure_date = trip_params[:destinations_attributes]["#{index}"][:departure_date]
      destination.arrival_date = Date.strptime(arrival_date, '%m/%d/%Y') if arrival_date.present?
      destination.departure_date = Date.strptime(departure_date, '%m/%d/%Y') if departure_date.present?
    end

    if @trip.save
      redirect_to trips_path
    else
      render 'new'
    end
  end
```


Show Decanter
---

```ruby
gem 'decanter'
```

application.rb:

```ruby
config.paths.add "app/decanter", eager_load: true
config.to_prepare do
  Dir[ File.expand_path(Rails.root.join("app/decanter/**/*.rb")) ].each do |file|
    require_dependency file
  end
end
```

restart server

```
rails g decanter Trip name:string start_date:date end_date:date destinations:has_many
rails g decanter Destination city:string state:string arrival_date:date departure_date:date
```

Update trips_controller
---

1. Remove code above @trip.save and add: @trip = Trip.decant_new(trip_params)

Show DateParser
---

- parse_format
- look at source code on github

Show Custom Parser
---

```
rails g parser Date
```

Show Squasher (if time permits)
---

```
rails g migration AddDateValuesToTrip
```

```
add_column :trips, :day, :integer
add_column :trips, :month, :integer
add_column :trips, :year, :integer
```

```erb
  <div>
    <%= f.label :day %>
    <%= f.text_field :day %>
  </div>
  <div>
    <%= f.label :month %>
    <%= f.text_field :month %>
  </div>
  <div>
    <%= f.label :year %>
    <%= f.text_field :year %>
  </div>
```

```ruby
input [:day, :month, :year], :date_squash, key: :start_date
```
