describe("Jungle TESTS!", () => {
  it("visits the home page", () => {
    cy.visit("0.0.0.0:3000");
  });
  it("Should add item to cart when add is clicked", () => {
    cy.get("[type=submit]").first().click({ force: true });
  });
  it("Verifies that the item is added to the cart", () => {
    cy.get("[alt=cart]").should("include.text", "My Cart (1)");
  });
  it("Should change the number in My Cart when add button is clicked", () => {
    cy.get("[type=submit]").first().click({ force: true });
    cy.get("[alt=cart]").should("include.text", "My Cart (2)");
  });
});
