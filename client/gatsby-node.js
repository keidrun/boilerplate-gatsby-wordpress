/**
 * Implement Gatsby's Node APIs in this file.
 *
 * See: https://www.gatsbyjs.org/docs/node-apis/
 */
const path = require('path');
const slash = require('slash');

exports.createPages = async ({ graphql, actions }) => {
  const { createPage, createRedirect } = actions;
  createRedirect({
    fromPath: '/',
    toPath: '/home',
    redirectInBrowser: true,
    isPermanent: true,
  });

  const result = await graphql(`
    {
      allWordpressPage {
        edges {
          node {
            id
            link
            status
            template
            title
            content
            slug
          }
        }
      }
      allWordpressPost {
        edges {
          node {
            id
            link
            status
            template
            format
            title
            content
            slug
          }
        }
      }
    }
  `);

  if (result.errors) {
    throw new Error(result.errors);
  }

  const { allWordpressPage, allWordpressPost } = result.data;

  const pageTemplate = path.resolve(`./src/templates/page.js`);
  allWordpressPage.edges.forEach(edge => {
    createPage({
      path: `/${edge.node.slug}/`,
      component: slash(pageTemplate),
      context: edge.node,
    });
  });

  const postTemplate = path.resolve(`./src/templates/post.js`);
  allWordpressPost.edges.forEach(edge => {
    createPage({
      path: `/post/${edge.node.slug}/`,
      component: slash(postTemplate),
      context: edge.node,
    });
  });
};
