import { FastifyInstance, FastifyRequest } from 'fastify'
import {
  registerTeacherController,
  registerStudentController,
  AuthenticateTeacherController,
} from '@/http/controllers'
// import { checkSessionIdExists } from '@/midlewares/check-session-id-exists'

export async function appRoutes(app: FastifyInstance) {
  app.addHook('preHandler', async (request: FastifyRequest) => {
    console.log(`[${request.method}] ${request.url}`)
  })

  app.post('/teacher/register', registerTeacherController)
  app.post('/teacher/authenticate', AuthenticateTeacherController)

  app.post('/student/register', registerStudentController)
}
