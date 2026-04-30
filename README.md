## STOCK TRADER BEHAVIOR CLUSTERING PROJECT

**1. Problem Statement**

A hedge fund and trading analytics firm wants to deeply understand trader behavior across its platform. Traders differ in terms of risk appetite, trading frequency, emotional discipline, leverage usage, and profitability. However, no predefined labels exist. The goal is to use unsupervised learning to segment traders into meaningful behavioral clusters. These clusters will help in risk profiling, strategy optimization, trader performance monitoring, and personalized trading insights.

**2. Domain Knowledge**

Trading behavior is multi-dimensional: • High-frequency traders execute many trades with low holding time. • Swing traders focus on medium-term price movements. • Long-term investors prioritize stability and low risk. • High-risk traders use leverage aggressively and experience large
drawdowns. • Emotional traders show inconsistency and poor risk management. Key concepts: • Win Rate vs PnL: High win rate does not always mean profitability. • Leverage: Amplifies both profits and losses. • Drawdown: Measures risk exposure. • Emotional Trading: Leads to irrational
decisions. • Consistency: Indicates disciplined strategy execution.

**3. Data Dictionary**

Feature Description

trades_per_day Number of trades executed daily

avg_trade_value Average value per trade

avg_holding_time_hours Duration trades are held

win_rate Percentage of profitable trades

risk_score Trader risk appetite score

monthly_pnl Profit and Loss

volatility_preference Preference for volatile markets

stop_loss_usage_ratio Risk management behavior

leverage_used Capital leverage used

max_drawdown Maximum loss experienced

emotional_trading_score Psychological instability indicator

consistency_score Stability of performance
