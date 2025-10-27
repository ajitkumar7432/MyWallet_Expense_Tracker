import { PieChart, Pie, Cell, ResponsiveContainer, Tooltip, Legend } from 'recharts';

function CategoryExpenseChart({ categorySummary }) {
    const COLORS = ["#ff6e6e", "#ffb26e", "#e6cd10", "#00a33c", "#6ea1ff", "#a36eff", "#ff6eff", "#6ee0ff", "#676d6e"];

    return (
        <div className='chart'>
            <div className="chart-top">
                <h2>Category-wise Expense</h2>
            </div>
            <ResponsiveContainer width="100%" height={250}>
                <PieChart>
                    <Pie
                        data={categorySummary}
                        cx="50%"
                        cy="50%"
                        innerRadius="55%"
                        outerRadius="75%"
                        fill="#8884d8"
                        dataKey="amount"
                        label
                    >
                        {categorySummary.map((entry, index) => (
                            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                        ))}
                    </Pie>
                    <Legend />
                    <Tooltip />
                </PieChart>
            </ResponsiveContainer>
        </div>
    )
}

export default CategoryExpenseChart;
