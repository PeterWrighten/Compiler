class NegExpr: public Expr {
    public: 
        NegExpr(Expr *e, Location *l);
        virtual void accept(Visitor*);
        virtual void dumpTo(std::ostream &);
    public:
        Expr *e;
};
