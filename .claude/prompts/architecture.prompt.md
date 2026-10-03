# Architecture Phase Prompt

Execute the Architecture phase of the Agentic SDLC.

## Task

Read the requirements from `requirements.md` and design a simple architecture that satisfies them.

## Instructions

1. **Read the Requirements**
   - Open `requirements.md`
   - Review all functional requirements (FR-001, FR-002, FR-003)
   - Understand the approved scope

2. **Design Minimal Architecture**
   - Identify the minimum components needed to satisfy the requirements
   - For this project:
     - FR-001 (Add Todo): Need UI input, add operation, list display
     - FR-002 (Edit Todo): Need edit UI, update operation, list update
     - FR-003 (Delete Todo): Need delete action, remove operation, list update
   - Keep it simple: browser-based, client-side if possible

3. **Define Components**
   - List each architectural component
   - Define the responsibility of each component
   - Keep the number of components minimal

4. **Define Data Flow**
   - Describe how data flows between components
   - Show the interaction for Add, Edit, Delete operations

5. **Select Technologies**
   - Choose simple, appropriate technologies
   - Justify each technology choice
   - Prefer standard web technologies (HTML, CSS, JavaScript)
   - Avoid over-engineering

6. **Maintain Traceability**
   - Map each functional requirement to architectural components
   - Show how the architecture satisfies each requirement
   - Create traceability table: FR → Components

7. **Enforce Simplicity**
   - Do NOT add backend services unless required by the requirements
   - Do NOT add databases unless required by the requirements
   - Do NOT add APIs unless required by the requirements
   - Do NOT add authentication unless required by the requirements
   - Keep the architecture minimal

8. **Generate Output**
   - Create `architecture.md` with sections:
     1. Overview
     2. Components
     3. Data Flow
     4. Technology Stack
     5. Requirements Traceability

9. **Verify**
   - Check: All functional requirements are addressed
   - Check: No unnecessary components added
   - Check: Technology choices are appropriate and simple
   - Check: Traceability is complete

10. **Stop**
    - Do NOT write implementation code
    - Do NOT proceed to Design Review phase
    - Report completion status
