import { FastifyInstance } from 'fastify'
import { registerTeacherController } from '@/http/controllers'

export async function appRoutes(app: FastifyInstance) {
  app.post('/teacher/register', registerTeacherController)
}
