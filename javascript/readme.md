# The Odin Project - Foundations & Intermediate Projects

Welcome to my repository featuring projects completed as part of **[The Odin Project](https://www.theodinproject.com/)** curriculum. You can view the live portfolio deployment hosting all these projects here: **[Live Portfolio Hub](https://zinthuaung-lab.github.io/The-Odin-Project/)**.

This repository demonstrates my progress in DOM manipulation, JavaScript logic, ES6 Modules, Webpack bundling, CSS layouts (Flexbox & Grid), and responsive UI designs.

---

## 🚀 Projects Overview

| Project                 | Description                                                                                                                                                                   | Tech Stack                                         | Live Demo                                                                             |
| :---------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------- | :------------------------------------------------------------------------------------ |
| **Portfolio Showcase**  | A dynamic central repository showcase featuring project search, technology filtering, interactive statistics, and a responsive grid layout.                                   | HTML5, CSS3, JS (ES6+)                             | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Portfolio/)         |
| **Flashcard-App**       | A custom study app featuring project/deck categorization, interactive card flipping, mastery status tracking, and re-hydrated object state saved via LocalStorage.            | HTML5, CSS3, JS (ES6 Modules, OOP)                 | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Flashcard-App/)      |
| **Todo List**           | A modern task management application featuring dynamic project separation, priority level tags, custom teal/emerald color themes, modal forms, and complete CRUD state logic. | HTML5, CSS3, JS (ES6 Modules)                      | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/ToDo%20List/)        |
| **Restaurant Page**     | A modern, single-page restaurant website featuring dynamic tabbed DOM navigation, scoped component styling, and clean module bundling via Webpack 5.                          | HTML5, CSS3, JS (ES6 Modules), Webpack 5           | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Restaurant%20Page/)  |
| **Tic-Tac-Toe**         | An interactive Tic-Tac-Toe game built with modular JavaScript architecture, object encapsulation, state management, and real-time UI turn/win status tracking.                  | HTML5, CSS3 (Grid), JS (Modules & Factory Functions) | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/TicTacToe/)          |
| **Library**             | An interactive web application for managing your personal book collection featuring OOP constructors, dynamic card rendering, status toggling, and a modal popup interface.   | HTML5, CSS3 (Grid & Flexbox), JS (OOP & DOM)       | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Library/)            |
| **Admin Dashboard**     | A full-featured admin dashboard layout featuring a sidebar navigation, dynamic top header controls, a project grid card section, and sidebar widgets.                         | HTML5, CSS3 (Grid & Flexbox)                       | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Admin%20Dashboard/) |
| **Sign-up Form**        | A modern, responsive sign-up form featuring a two-column desktop layout, custom form inputs, floating branding banner, and active focus/error styling.                          | HTML5, CSS3 (Flexbox), JS                          | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Sign-Up-Form/)       |
| **Calculator**          | A sleek, dark-mode web calculator featuring robust mathematical state management, custom scrollable display handling, and automatic scientific notation for extreme numbers.  | HTML5, CSS3 (Grid), JS (ES6+)                      | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Calculator/)         |
| **Etch-a-Sketch**       | An interactive pixel-drawing grid application supporting dynamic grid sizing, progressive shading (opacity darkening), and custom color effects.                              | HTML5, CSS3 (Grid), JS (DOM)                       | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Etch-a-Sketch/)      |
| **Rock-Paper-Scissors** | Classic Rock-Paper-Scissors game featuring an interactive graphical user interface, score tracking, and real-time round outcome displays.                                       | HTML5, CSS3, JS (ES6+)                             | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/Rock-Paper-Scissor/) |
| **Odin Recipes**        | A clean, multi-page HTML recipe website focusing on structured semantic elements, internal linking, and styled layout.                                                        | HTML5, CSS3                                        | [Live Preview](https://zinthuaung-lab.github.io/The-Odin-Project/odin-recipes/)      |

---

## 🛠️ Key Features & Concepts Learned

### 🌐 Portfolio Showcase

- **Real-Time Search & Tag Filtering:** Engineered instant client-side filtering matching search queries across project titles, descriptions, and technology tags, with interactive tag button states.
- **Dynamic Statistics Computation:** Automatically computes total project counts, unique technology tools used, and JavaScript-focused application metrics on runtime initialization.
- **Responsive Layout & Cards:** Designed a flexible, modern UI grid with custom badges, hover transitions, and clean source code links.

### 🧠 Study Aid & Flashcards

- **Object Re-hydration & Class Persistence:** Solved `localStorage` serialization limitations by reconstructing raw JSON payloads back into functional `Project` and `Flashcard` OOP class instances upon application boot.
- **Decoupled State Management:** Built an independent `StudyApp` state controller to isolate active project selection, card updates, and data persistence away from UI DOM rendering.
- **Interactive UI & Memory Logic:** Engineered interactive 3D card-flip animations, mastery status toggling, and instant modal card creation tailored for daily micro-learning sessions.

### 📝 Todo List

- **Custom Architectural Styling & Design Systems:** Implemented a unique Teal & Mint Accent layout with slate-tinted sidebars, custom-styled checkbox inputs, priority indicator borders (Rose, Amber, Emerald), and accessible form dialogues.
- **State & Data Management:** Managed dynamic task updates, custom project switching, priority status tagging, modal dialog states, and list rendering without full page reloads.
- **Modular Component Isolation:** Structured components with independent logic modules for managing task completion status, project deletion, and form control interactions.

### 🍽️ Restaurant Page

- **Webpack 5 & Asset Management:** Configured custom entry/output builds, `html-webpack-plugin`, dynamic asset injection (`asset/resource`), and CSS loaders to produce an optimized production bundle directly at project root.
- **ES6 Modular Architecture:** Refactored static scripts into clean ES modules (`home.js`, `menu.js`, `contact.js`) using `import`/`export` syntax for pure dynamic DOM generation.
- **Scoped Style Isolation:** Built modular CSS rules preventing navigation bar layout collisions and ensuring consistent UI styling across dynamic tab transitions.

### ❌⭕ Tic-Tac-Toe

- **Module Pattern & Factory Functions:** Encapsulated state and behavior inside Module IIFEs (`GameBoard`, `GameController`, `DisplayController`) and Factory Functions (`createPlayer`) to keep the global scope completely clean.
- **Strict Separation of Concerns:** Isolated data logic from DOM presentation—`GameBoard` stores grid array state, `GameController` evaluates turn switches and victory combinations, and `DisplayController` handles user events and DOM updates.
- **Dynamic State & UI Syncing:** Controlled game lifecycle (round execution, duplicate click guards, win/tie evaluation, game reset) with real-time feedback rendered directly to the screen banner.

### 📚 Library

- **Object-Oriented JavaScript:** Used constructor functions/prototypes and unique IDs (`crypto.randomUUID()`) to encapsulate book data and methods.
- **Dynamic DOM Manipulation:** Re-rendered the book grid dynamically upon adding, deleting, or toggling read statuses.
- **Interactive Modal Interface:** Implemented a custom overlay modal form with input validation to seamlessly capture new book entries without refreshing the page.

### 📊 Admin Dashboard

- **Advanced Grid & Flexbox Layout:** Architected a complex dashboard structure combining a two-column CSS Grid page wrapper with inner Flexbox layouts for header alignment and card sizing.
- **Custom UI Form Components:** Standardized search inputs and action buttons by overriding default browser styling using `appearance: none` and exact padding controls.
- **Visual Parity & Alignment:** Applied precise `align-items: center` logic across header sections to ensure clean horizontal cross-axis alignment for avatars, icons, and text.

### 📝 Sign-up Form

- **Flexbox & Split Layouts:** Implemented a side-by-side hero image sidebar and content area, optimized for desktop and responsive viewports.
- **Form Controls & Styling:** Custom-styled form control states including input focus rings, active states, and error highlighting for mismatched fields.
- **Overlay Design:** Built semi-transparent logo overlays over background images using CSS position absolute and background positioning techniques.

### 🧮 Calculator

- **State & Logic Management:** Handles complex operation chaining, sequential operator inputs, input overwriting post-calculation, and edge cases like division by zero.
- **Dynamic Display & Formatting:** Built a scrollable text display container with custom scrollbar styling to prevent UI overflow, backed by `toExponential()` formatting for large/extreme values.
- **CSS Grid Layout:** Designed a dark-mode user interface using CSS Grid for alignment and interactive states.

### 🎨 Etch-a-Sketch

- **Dynamic CSS Grid Rendering:** Used JavaScript DOM manipulation (`DocumentFragment`) to generate customizable $N \times N$ grids.
- **Sub-Pixel Gap Prevention:** Resolved browser rounding artifacts by applying strict `box-sizing: border-box` and matching container backgrounds.
- **Progressive Opacity Effect:** Leveraged HTML `dataset` attributes to calculate and darken cell opacity incrementally on hover.

### 🎮 Rock-Paper-Scissors

- **UI State Management:** Transitioned game mechanics from console outputs to modern interactive DOM elements.
- **Event Listeners:** Managed user interactions and conditional logic to evaluate dynamic round scores and victory states.

### 🍲 Odin Recipes

- **Semantic HTML Structure:** Built structured web pages using proper headings, lists (`<ol>`, `<ul>`), and clean navigation links.

---

## 💻 How to Run Locally

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/ZinThuAung-LAB/The-Odin-Project.git](https://github.com/ZinThuAung-LAB/The-Odin-Project.git)