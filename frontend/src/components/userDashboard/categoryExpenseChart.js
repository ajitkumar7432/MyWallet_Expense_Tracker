import { PieChart, Pie, Cell, ResponsiveContainer, Tooltip, Legend } from 'recharts';

function CategoryExpenseChart({ categorySummary }) {
    // Fintech Theme Colors - Yellow, Orange, Green, Red (no grey)
    const COLORS = [
        "#FFC72C", // Primary Yellow
        "#FF8A00", // Orange Accent
        "#E63946", // Red Error
        "#2ECC71", // Green Success
        "#FFC72C", // Yellow repeat for more categories
        "#FF8A00", // Orange repeat
        "#E63946", // Red repeat
        "#2ECC71", // Green repeat
        "#000000"  // Black for final category if needed
    ];

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
                        label={{
                            fill: 'var(--text-primary)',
                            fontWeight: 'bold',
                            fontSize: 14
                        }}
                    >
                        {categorySummary.map((entry, index) => (
                            <Cell 
                                key={`cell-${index}`} 
                                fill={COLORS[index % COLORS.length]}
                                stroke="#FFFFFF"
                                strokeWidth={2}
                            />
                        ))}
                    </Pie>
                    <Legend 
                        wrapperStyle={{
                            fontWeight: '700',
                            fontSize: '14px',
                            color: 'var(--text-primary)'
                        }}
                        formatter={(value) => <span style={{ color: 'var(--text-primary)' }}>{value}</span>}
                    />
                    <Tooltip 
                        contentStyle={{
                            backgroundColor: '#000000',
                            border: '2px solid #FFC72C',
                            borderRadius: '8px',
                            color: '#FFFFFF',
                            fontWeight: '600'
                        }}
                    />
                </PieChart>
            </ResponsiveContainer>
        </div>
    )
}

export default CategoryExpenseChart;

