import Express, { Request, Response } from 'express';

const app = Express();

app.get('/', (req: Request, res: Response) => {


  res.status(200).send({ err: 'ok' });
});

app.listen(3000);