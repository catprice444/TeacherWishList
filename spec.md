# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has_many items) 
- [x] Include at least one belongs_to relationship (Item belongs_to School)
- [x] Include at least two has_many through relationships ( User has_many Schools through Items and School has_many users through Items)
- [x] Include at least one many-to-many relationship (User has_many Schools through Items and School has_many users through Items)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (User can submit a school name)
- [x] Include reasonable validations for simple model objects (User, School, and Item have validations)
- [x] Include a class level ActiveRecord scope method (Items can be ordered alphabetically)
- [x] Include signup (BCrypt)
- [x] Include login (BCrypt)
- [x] Include logout (BCrypt)
- [ ] Include third party signup/login (OmniAuth)
- [x] Include nested resource show or index (URL e.g. schools/1/items)
- [x] Include nested resource "new" form (URL e.g. schools/1/items/new)
- [x] Include form display of validation errors (form URL e.g. /schools/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate