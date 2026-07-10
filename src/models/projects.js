import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT p.title, o.name AS organization_name, p.date
      FROM public.projects p
      JOIN public.organization o ON p.organization_id = o.organization_id
      ORDER BY p.date ASC;
    `;

    const result = await db.query(query);

    return result.rows;
}

export { getAllProjects }  
