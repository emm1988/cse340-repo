import db from './db.js'

const getAllCategories = async () => {
    const query = `
        SELECT category_id, name, description
      FROM public.categories;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getCategoryDetails = async (id) => {
  const query = `
    SELECT category_id, name, description
    FROM public.categories
    WHERE category_id = $1;
  `;
  const result = await db.query(query, [id]);
  return result.rows[0];
};
  
export { getAllCategories, getCategoryDetails }; 