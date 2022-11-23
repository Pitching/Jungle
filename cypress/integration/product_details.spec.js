describe('navigation on the front page', () => {
  
  it('visits the home page on the jungle app', () => {
    cy.visit('/');
  })

  it('There are products on the page', () => {
    cy.get(".products article").should("be.visible");
  })

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('clicks on the product to be taken to the product page', () => {
    cy.get('.products article').first().click()
    cy.get('.product-detail')
      .get('h1')
      .contains('Scented Blade')
    cy.get('.product-detail')
      .get('p')
      .contains('The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.')
    cy.get('.quantity')
      .contains('$24.99')
  })
})