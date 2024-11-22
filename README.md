**Event Management System**
**Overview**
The Event Management System is a PostgreSQL-based project designed to streamline the creation, management, and tracking of events, attendees, and registrations. This system ensures efficient handling of event-related data, making it an ideal solution for organizations, event planners, and businesses.

**Objective**
**The primary aim of this project is to design and implement a relational database that:**
    Simplifies event creation and management.
    Tracks attendee details effectively.
    Handles event registrations seamlessly.
    Provides robust data retrieval for event analysis and reporting.

**Features**

  **Event Management**
        Create, update, and delete events with essential details like name, date, location, and description.

  **Attendee Management**
        Store attendee information, including names, contact details, and city.
        Add and manage attendees participating in events.

  **Registration Management**
        Track event registrations, including registration dates and amounts.
        Link attendees to their registered events.

  **Data Retrieval and Reporting**
        Generate attendee lists for specific events.
        Analyze event participation and calculate attendance statistics.

**Database Structure**
**This system is built using three core tables:**

  **Events:** Stores event details like ID, name, date, location, and description.
  **Attendees:** Stores attendee information such as ID, name, phone number, email, and city.
  **Registrations:** Tracks the relationship between events and attendees, including registration dates and amounts.

**Relationships between tables are enforced using foreign keys, ensuring data integrity and consistency.
Technologies Used**

    SQL: For implementing CRUD operations and advanced queries.
