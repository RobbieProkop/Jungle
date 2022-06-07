describe("Jungle TESTS!", () => {
  it("visits the home page", () => {
    cy.visit("0.0.0.0:3000");
  });
  it("Should click the product", () => {
    cy.get(".products article").first().click();
  });
  it("should visit the product page when clicked", () => {
    cy.get(".products article")
      .first()
      .click()
      .visit("0.0.0.0:3000/products/12");
  });
});
