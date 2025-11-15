import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

function IncomeVsExpenseChart({ data }) {

    return (
        <ResponsiveContainer>

            <LineChart
                width={500}
                height={300}
                data={data}
                margin={{
                    top: 20,
                    right: 20,
                    left: 20,
                    bottom: 10,
                }}
            >
                <CartesianGrid strokeDasharray="3 3" stroke="#FFC72C" opacity={0.2} />
                <XAxis 
                    dataKey="monthName" 
                    fontSize='12px'
                    fontWeight='600'
                    stroke="#FFC72C"
                />
                <YAxis 
                    fontSize='12px'
                    fontWeight='600'
                    stroke="#FFC72C"
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
                <Legend 
                    wrapperStyle={{
                        fontWeight: '700',
                        fontSize: '14px'
                    }}
                />
                <Line 
                    type="monotone" 
                    dataKey="totalExpense" 
                    name='Expense' 
                    stroke="#E63946" 
                    strokeWidth={3}
                    activeDot={{ r: 6, fill: '#E63946' }} 
                />
                <Line 
                    type="monotone" 
                    dataKey="totalIncome" 
                    name='Income' 
                    stroke="#2ECC71"
                    strokeWidth={3}
                    activeDot={{ r: 6, fill: '#2ECC71' }}
                />
            </LineChart>

        </ResponsiveContainer>
    )      
}

export default IncomeVsExpenseChart;