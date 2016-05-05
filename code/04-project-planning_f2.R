DiagrammeR::mermaid("gantt
        dateFormat  YYYY-MM-DD

        section 2 chapters
        Write Chapter 2           :done,    des1, 2015-10-15,2015-11-24
        Write Chapter 3           :done,    des2, 2015-10-15,2015-11-24
        Review Chapter 2          :done,  des3, 2015-12-03,2016-01-10
        Review Chapter 3          :active,  des4, 2015-12-03,2016-01-10

        section 1st half
        Write Chapter 4          :crit, active, 2015-12-19,2016-01-19
        Write Chapter 6          :crit, active, 2015-12-19,2016-01-19
        Review Chapter 4          :active, 2016-01-30,2016-03-01
        Review Chapter 6          :active, 2016-01-30,2016-03-01

        section 2nd half
        Write Chapter 5               :active, a1, 2016-03-01,2016-04-15
        Write Chapter 7               :active, a1, 2016-03-01,2016-04-15
        Write Chapter 1               :active, a1, 2016-03-08,2016-05-03
        Write Chapter 8               :active, c8, 2016-03-20,2016-05-03
        Technical review              :crit, active, a1, 2016-05-03,2016-05-30
        Complete final draft          :active, c8, 2016-05-30,2016-06-28
")