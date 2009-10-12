#include "event.h"

#include "module.h"

#include "majortable.h"
#include "unitofmeasure.h"
#include "log.h"

Event::Event ( ) {
}

Event::~Event ( ) { }

void Event::setEventID ( int new_var ) {
			eventID = new_var;
}

int Event::getEventID ( ) {
			return eventID;
}

void Event::setModule ( Module * new_var ) {
			module = new_var;
}

Module * Event::getModule ( ) {
			return module;
}

void Event::setLog ( Log * new_var ) {
			log = new_var;
}

Log * Event::getLog ( ) {
			return log;
}

void Event::setActivity ( Activity * new_var ) {
			activity = new_var;
}

Activity * Event::getActivity ( ) {
			return activity;
}

void Event::setLocation ( Location * new_var ) {
			location = new_var;
}

Location * Event::getLocation ( ) {
			return location;
}

void Event::setUnitOfMeasure ( UnitOfMeasure * new_var ) {
			unitOfMeasure = new_var;
}

UnitOfMeasure * Event::getUnitOfMeasure ( ) {
			return unitOfMeasure;
}

void Event::setMeasurementValue ( double new_var ) {
			measurementValue = new_var;
}

double Event::getMeasurementValue ( ) {
			return measurementValue;
}

void Event::setDateOccured ( string new_var ) {
			dateOccured = new_var;
}

string Event::getDateOccured ( ) {
			return dateOccured;
}

void Event::setImagePath ( string new_var ) {
			imagePath = new_var;
}

string Event::getImagePath ( ) {
			return imagePath;
}

void Event::setNotes ( string new_var ) {
			notes = new_var;
}

string Event::getNotes ( ) {
			return notes;
}

void Event::setShow ( bool new_var ) {
			show = new_var;
}

bool Event::getShow ( ) {
			return show;
}

