#include "entity.h"

#include "module.h"
#include "majortable.h"

// Constructors/Destructors
//  

Entity::Entity()
{
}

Entity::~Entity()
{ }

void Entity::setEntityID(const int new_var)
{
			entityID = new_var;
}

int Entity::getEntityID()
{
			return entityID;
}

void Entity::setModule(Module * new_var)
{
			module = new_var;
}

Module * Entity::getModule()
{
			return module;
}

void Entity::setName(const string new_var)
{
			name = new_var;
}

string Entity::getName()
{
			return name;
}

void Entity::setDescription(const string new_var)
{
			description = new_var;
}

string Entity::getDescription()
{
			return description;
}

void Entity::setImagePath(const string new_var)
{
			imagePath = new_var;
}

string Entity::getImagePath()
{
			return imagePath;
}

void Entity::setVariety(Variety * new_var)
{
			variety = new_var;
}

Variety * Entity::getVariety()
{
			return variety;
}

void Entity::setLocation(Location * new_var)
{
			location = new_var;
}

Location * Entity::getLocation()
{
			return location;
}

void Entity::setSource(Source * new_var)
{
			source = new_var;
}

Source * Entity::getSource()
{
			return source;
}

void Entity::setEvents (const vector<Event> new_var)
{
			events = new_var;
}

vector<Event> Entity::getEvents()
{
			return events;
}

void Entity::setShow(bool new_var)
{
			show = new_var;
}

bool Entity::getShow()
{
			return show;
}
