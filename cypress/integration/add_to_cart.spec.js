describe('navigation on the front page', () => {
  
  it('visits the home page on the jungle app', () => {
    cy.visit('/');
  });

  it('There are products on the page', () => {
    cy.get(".products article").should("be.visible");
  })

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Adds an item to the cart and updates the cart by one", () => {
    cy.get(".products article").first();
    cy.get(".btn").click({force: true});
    cy.get(".nav-link").contains("My Cart (1)");
  });
});