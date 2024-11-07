# Godo

A To-do to help you to manage your tasks swiftly with ease and gets you to "go do" it!

## Setup

- Flutter SDK version : 3.24.3
- Firebase account
- Dart >= 3.0

## Project architecture
```
- assets (contains all the different assets we might use in the app)
- lib (contains the source code for everything which drives the app)
├───core (contains code which drives the core functionality of the app)
│   ├───network
│   │   └───apiClient
│   │       └───clients
│   ├───router
│   ├───theming
│   └───utils
│       └───extensions
└───src (source code for all the features segregated on the basis of functional layers)
    ├───application (Services)
    ├───data (DB interaction layer, DAOs source)
    ├───domain (Data modelling layer)
    └───presentation (UI layer)
```
## Tasks
1. Initial Setup
   - Plan the architecture (1.5 hour)
   - Create the required empty files (15 minutes)
   - Cross verify the created files with the previously created plan (15 mins)
   - UI design and tasks planning (~1.5 hrs)
2. Initial UI Implementation
   - View all tasks screen (2.15 hrs)
   - Add task flow (30 mins)
   - Update task flow (1 hr)
   - Filter tasks flow based on categories
3. Initial setup backend
   - Entity relationship diagram
   - Database schema design
   - Project architecture
4. Implement the REST APIs
   - User auth APIs
   - Task and categories related APIs
   - Notification related logic
5. Setup frontend for backend integration
   - Verify all the entity models add if any absent
   - Configure reduxconnectors and view models classes
   - Verify repositories
   - Bind everything together (state and UI)
6. API integration with the UI
   - User, tasks, and categories API integration while adding any UI components if required
   - Notifications configuration and handling on the frontend
7. Implement stats flow in the UI
8. Test the app for each use case
9. Check documentation once
10. Deliver the project

# Progress Report (R - Research, D - Dev)
### Sprint-1 (6 hours, Goal : "1.", "2.1")
1. **Initial Setup**
   - [x] Plan the architecture (1.5 hour)
   - [x] Create the required empty files (15 minutes)
   - [x] Cross verify the created files with the previously created plan (15 mins)
   - [x] UI design and tasks planning (2 hrs) (1.5-D, 0.5-R)
2. **UI Implementation**
   - [x] View all tasks screen (2.15 hrs)
### Sprint-2 (6 hours, Goal : "2.", "3.1, 3.2", "4.", "5.1", "6.1)
2. **UI Implementation**
   - [x] View all tasks screen (2.15 hrs)
   - [x] Add task flow (30 mins)
   -- [x] Handle auto expanding bottom sheet with the bottom row anchored scenario (1 hr)
   -- [x] Enhancements in the all tasks screen and some UI fixes (~45 mins)
   - Update task flow
   - Filter tasks flow based on categories
3. **Initial setup backend**
   - Entity relationship diagram
   - Database schema design
   - Project architecture
4. **Implement the REST APIs**
   - User auth APIs
   - Task and categories related APIs
5. **Setup frontend for backend integration**
   - Verify all the entity models add if any absent
   - Configure reduxconnectors and view models classes
   - Verify repositories
   - Bind everything together (state and UI)
6. **API integration with the UI**
   - User, tasks, and categories API integration
