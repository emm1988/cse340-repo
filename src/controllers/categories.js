import { getAllCategories, getCategoryDetails } from '../models/categories.js';
import { getProjectsByCategoryId } from '../models/projects.js';

const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Categories';
    res.render('categories', { title, categories });
};

const showCategoryDetailsPage = async (req, res) => {
    const categoryId = req.params.id;

    const category = await getCategoryDetails(categoryId);
    const projects = await getProjectsByCategoryId(categoryId);

    const title = `${category.name} Projects`;

    res.render('category', { title, category, projects });
};

// Export controller functions
export { showCategoriesPage, showCategoryDetailsPage };