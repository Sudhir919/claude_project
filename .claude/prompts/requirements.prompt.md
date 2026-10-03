# Requirements Phase Prompt

Execute the Requirements phase of the Agentic SDLC.

## Task

Read the user story from `docs/user-story.md` and produce a requirements document.

## Instructions

1. **Read the User Story**
   - Open `docs/user-story.md`
   - Identify the user story statement
   - Identify all acceptance criteria (AC-1, AC-2, AC-3)

2. **Extract Functional Requirements**
   - Create one functional requirement (FR-001, FR-002, etc.) for each acceptance criterion
   - Maintain traceability: FR-001 → AC-1, FR-002 → AC-2, FR-003 → AC-3
   - Use the format:
     - Description: What the user shall be able to do
     - Details: The acceptance criterion text
     - Traceability: The AC identifier

3. **Define Scope**
   - List only the features explicitly stated in the acceptance criteria
   - For this project: Add Todo, Edit Todo, Delete Todo
   - Do NOT add features not present in the user story

4. **Create Traceability Table**
   - Map each acceptance criterion to its functional requirement
   - Verify complete coverage: all ACs have corresponding FRs

5. **Document Out of Scope**
   - List common features that are NOT in the user story
   - Examples: persistence, authentication, completion status, search, filtering

6. **Generate Output**
   - Create `requirements.md` with sections:
     1. Scope
     2. Functional Requirements
     3. Acceptance Criteria Traceability
     4. Out of Scope

7. **Verify**
   - Check: All acceptance criteria are covered
   - Check: No additional product features introduced
   - Check: Traceability is complete and correct

8. **Stop**
   - Do NOT proceed to Architecture phase
   - Report completion status
