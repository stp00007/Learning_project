import pytest
from pytest_bdd import scenarios, given, when, then, parsers
from playwright.sync_api import Page, expect
import logging

# 1. Load the feature file
scenarios('../features/web_search.feature')

# 2. Define the steps

@given('I open the DuckDuckGo homepage')
def open_homepage(page: Page):
    page.goto("https://duckduckgo.com")

@when(parsers.parse('I search for the phrase "{text}"'))
def search_phrase(page: Page, text: str):
    # Locate the search bar, fill it, and press enter
    page.locator('input[name="q"]').fill(text)
    page.keyboard.press("Enter")
    # Configure logger at module level
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.DEBUG)

    # Then in your search_phrase function, add logging after the search action:
    logger.debug(f'Searching for: {text}')
    page.wait_for_load_state('networkidle')
    logger.info(f'Search completed for phrase: {text}')
    

@then(parsers.parse('the search results title should contain "{text}"'))
def verify_title(page: Page, text: str):
    # Playwright's auto-wait assertions
    expect(page).to_have_title(f'{text} at DuckDuckGo')
    print(page.title())