import { FastifyInstance } from 'fastify'
import {
  registerTeacherController,
  registerStudentController,
} from '@/http/controllers'

export async function appRoutes(app: FastifyInstance) {
  app.post('/teacher/register', registerTeacherController)
  app.post('/student/register', registerStudentController)
}
